rule win_gaudox_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2022-05-16"
        version = "1"
        description = "Detects win.gaudox."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.gaudox"
        malpedia_rule_date = "20220513"
        malpedia_hash = "7f4b2229e6ae614d86d74917f6d5b41890e62a26"
        malpedia_version = "20220516"
        malpedia_license = "CC BY-SA 4.0"
        malpedia_sharing = "TLP:WHITE"

    /* DISCLAIMER
     * The strings used in this rule have been automatically selected from the
     * disassembly of memory dumps and unpacked files, using YARA-Signator.
     * The code and documentation is published here:
     * https://github.com/fxb-cocacoding/yara-signator
     * As Malpedia is used as data source, please note that for a given
     * number of families, only single samples are documented.
     * This likely impacts the degree of generalization these rules will offer.
     * Take the described generation method also into consideration when you
     * apply the rules in your use cases and assign them confidence levels.
     */


    strings:
        $sequence_0 = { 8bca b830303030 c1e902 f3ab 8bca }
            // n = 5, score = 200
            //   8bca                 | mov                 ecx, edx
            //   b830303030           | mov                 eax, 0x30303030
            //   c1e902               | shr                 ecx, 2
            //   f3ab                 | rep stosd           dword ptr es:[edi], eax
            //   8bca                 | mov                 ecx, edx

        $sequence_1 = { 0f8497020000 8b4d08 85c9 0f848c020000 8b7d0c 85ff }
            // n = 6, score = 200
            //   0f8497020000         | je                  0x29d
            //   8b4d08               | mov                 ecx, dword ptr [ebp + 8]
            //   85c9                 | test                ecx, ecx
            //   0f848c020000         | je                  0x292
            //   8b7d0c               | mov                 edi, dword ptr [ebp + 0xc]
            //   85ff                 | test                edi, edi

        $sequence_2 = { eb0e 85d2 0f84c5010000 890d???????? 85f6 0f84b7010000 }
            // n = 6, score = 200
            //   eb0e                 | jmp                 0x10
            //   85d2                 | test                edx, edx
            //   0f84c5010000         | je                  0x1cb
            //   890d????????         |                     
            //   85f6                 | test                esi, esi
            //   0f84b7010000         | je                  0x1bd

        $sequence_3 = { b8???????? 8bcf 2bc2 2bf2 89442464 b8???????? 2bc2 }
            // n = 7, score = 200
            //   b8????????           |                     
            //   8bcf                 | mov                 ecx, edi
            //   2bc2                 | sub                 eax, edx
            //   2bf2                 | sub                 esi, edx
            //   89442464             | mov                 dword ptr [esp + 0x64], eax
            //   b8????????           |                     
            //   2bc2                 | sub                 eax, edx

        $sequence_4 = { 7506 c702???????? 8b4f08 85c9 7404 3bf1 737c }
            // n = 7, score = 200
            //   7506                 | jne                 8
            //   c702????????         |                     
            //   8b4f08               | mov                 ecx, dword ptr [edi + 8]
            //   85c9                 | test                ecx, ecx
            //   7404                 | je                  6
            //   3bf1                 | cmp                 esi, ecx
            //   737c                 | jae                 0x7e

        $sequence_5 = { 55 8bec 83b91403000000 7415 ffb110030000 ff35???????? 6a03 }
            // n = 7, score = 200
            //   55                   | push                ebp
            //   8bec                 | mov                 ebp, esp
            //   83b91403000000       | cmp                 dword ptr [ecx + 0x314], 0
            //   7415                 | je                  0x17
            //   ffb110030000         | push                dword ptr [ecx + 0x310]
            //   ff35????????         |                     
            //   6a03                 | push                3

        $sequence_6 = { 8bf8 897df8 85ff 7847 c605????????00 }
            // n = 5, score = 200
            //   8bf8                 | mov                 edi, eax
            //   897df8               | mov                 dword ptr [ebp - 8], edi
            //   85ff                 | test                edi, edi
            //   7847                 | js                  0x49
            //   c605????????00       |                     

        $sequence_7 = { 6a00 6a00 6a32 6a00 e8???????? 85c0 0f8859020000 }
            // n = 7, score = 200
            //   6a00                 | push                0
            //   6a00                 | push                0
            //   6a32                 | push                0x32
            //   6a00                 | push                0
            //   e8????????           |                     
            //   85c0                 | test                eax, eax
            //   0f8859020000         | js                  0x25f

        $sequence_8 = { b90a020000 8b442424 3bd8 0f8535ffffff 8b54241c }
            // n = 5, score = 200
            //   b90a020000           | mov                 ecx, 0x20a
            //   8b442424             | mov                 eax, dword ptr [esp + 0x24]
            //   3bd8                 | cmp                 ebx, eax
            //   0f8535ffffff         | jne                 0xffffff3b
            //   8b54241c             | mov                 edx, dword ptr [esp + 0x1c]

        $sequence_9 = { 50 6a07 ff35???????? 6a2d 6a00 e8???????? 85c0 }
            // n = 7, score = 200
            //   50                   | push                eax
            //   6a07                 | push                7
            //   ff35????????         |                     
            //   6a2d                 | push                0x2d
            //   6a00                 | push                0
            //   e8????????           |                     
            //   85c0                 | test                eax, eax

    condition:
        7 of them and filesize < 155648
}