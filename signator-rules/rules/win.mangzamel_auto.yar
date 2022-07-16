rule win_mangzamel_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2022-05-16"
        version = "1"
        description = "Detects win.mangzamel."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.mangzamel"
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
        $sequence_0 = { 7433 8d85d8feffff 6804010000 50 6a00 ff15???????? 6aff }
            // n = 7, score = 400
            //   7433                 | je                  0x35
            //   8d85d8feffff         | lea                 eax, [ebp - 0x128]
            //   6804010000           | push                0x104
            //   50                   | push                eax
            //   6a00                 | push                0
            //   ff15????????         |                     
            //   6aff                 | push                -1

        $sequence_1 = { 6801100000 ff75ec e8???????? 85c0 742c ff7518 8d8d88fdffff }
            // n = 7, score = 400
            //   6801100000           | push                0x1001
            //   ff75ec               | push                dword ptr [ebp - 0x14]
            //   e8????????           |                     
            //   85c0                 | test                eax, eax
            //   742c                 | je                  0x2e
            //   ff7518               | push                dword ptr [ebp + 0x18]
            //   8d8d88fdffff         | lea                 ecx, [ebp - 0x278]

        $sequence_2 = { 8b45e4 898684000000 8b45ec 89868c000000 8b45e8 85c0 bf05000102 }
            // n = 7, score = 400
            //   8b45e4               | mov                 eax, dword ptr [ebp - 0x1c]
            //   898684000000         | mov                 dword ptr [esi + 0x84], eax
            //   8b45ec               | mov                 eax, dword ptr [ebp - 0x14]
            //   89868c000000         | mov                 dword ptr [esi + 0x8c], eax
            //   8b45e8               | mov                 eax, dword ptr [ebp - 0x18]
            //   85c0                 | test                eax, eax
            //   bf05000102           | mov                 edi, 0x2010005

        $sequence_3 = { 8b06 6800120011 8bce ff5004 8bf0 3bf3 7411 }
            // n = 7, score = 400
            //   8b06                 | mov                 eax, dword ptr [esi]
            //   6800120011           | push                0x11001200
            //   8bce                 | mov                 ecx, esi
            //   ff5004               | call                dword ptr [eax + 4]
            //   8bf0                 | mov                 esi, eax
            //   3bf3                 | cmp                 esi, ebx
            //   7411                 | je                  0x13

        $sequence_4 = { 8bf0 85f6 7449 6a18 8d45e8 6a00 50 }
            // n = 7, score = 400
            //   8bf0                 | mov                 esi, eax
            //   85f6                 | test                esi, esi
            //   7449                 | je                  0x4b
            //   6a18                 | push                0x18
            //   8d45e8               | lea                 eax, [ebp - 0x18]
            //   6a00                 | push                0
            //   50                   | push                eax

        $sequence_5 = { 8845ff e9???????? 8b5518 8b7908 52 8b4205 ff7514 }
            // n = 7, score = 400
            //   8845ff               | mov                 byte ptr [ebp - 1], al
            //   e9????????           |                     
            //   8b5518               | mov                 edx, dword ptr [ebp + 0x18]
            //   8b7908               | mov                 edi, dword ptr [ecx + 8]
            //   52                   | push                edx
            //   8b4205               | mov                 eax, dword ptr [edx + 5]
            //   ff7514               | push                dword ptr [ebp + 0x14]

        $sequence_6 = { 5e c20400 b800002002 c3 55 8bec 83ec64 }
            // n = 7, score = 400
            //   5e                   | pop                 esi
            //   c20400               | ret                 4
            //   b800002002           | mov                 eax, 0x2200000
            //   c3                   | ret                 
            //   55                   | push                ebp
            //   8bec                 | mov                 ebp, esp
            //   83ec64               | sub                 esp, 0x64

        $sequence_7 = { 8bf0 59 85f6 59 744e 8b450c c1e810 }
            // n = 7, score = 400
            //   8bf0                 | mov                 esi, eax
            //   59                   | pop                 ecx
            //   85f6                 | test                esi, esi
            //   59                   | pop                 ecx
            //   744e                 | je                  0x50
            //   8b450c               | mov                 eax, dword ptr [ebp + 0xc]
            //   c1e810               | shr                 eax, 0x10

        $sequence_8 = { 6a00 e8???????? ff7514 8b4d1c 56 e8???????? 50 }
            // n = 7, score = 400
            //   6a00                 | push                0
            //   e8????????           |                     
            //   ff7514               | push                dword ptr [ebp + 0x14]
            //   8b4d1c               | mov                 ecx, dword ptr [ebp + 0x1c]
            //   56                   | push                esi
            //   e8????????           |                     
            //   50                   | push                eax

        $sequence_9 = { 50 e8???????? 8b4508 83c40c 8945f0 8d45e4 53 }
            // n = 7, score = 400
            //   50                   | push                eax
            //   e8????????           |                     
            //   8b4508               | mov                 eax, dword ptr [ebp + 8]
            //   83c40c               | add                 esp, 0xc
            //   8945f0               | mov                 dword ptr [ebp - 0x10], eax
            //   8d45e4               | lea                 eax, [ebp - 0x1c]
            //   53                   | push                ebx

    condition:
        7 of them and filesize < 360448
}