rule win_innaput_rat_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2022-05-16"
        version = "1"
        description = "Detects win.innaput_rat."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.innaput_rat"
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
        $sequence_0 = { 8945fc ff15???????? 8d7710 eb02 }
            // n = 4, score = 500
            //   8945fc               | mov                 dword ptr [ebp - 4], eax
            //   ff15????????         |                     
            //   8d7710               | lea                 esi, [edi + 0x10]
            //   eb02                 | jmp                 4

        $sequence_1 = { 740f 8b4d08 e8???????? 3b450c }
            // n = 4, score = 500
            //   740f                 | je                  0x11
            //   8b4d08               | mov                 ecx, dword ptr [ebp + 8]
            //   e8????????           |                     
            //   3b450c               | cmp                 eax, dword ptr [ebp + 0xc]

        $sequence_2 = { 8bc8 2bf1 8a08 884c0616 }
            // n = 4, score = 500
            //   8bc8                 | mov                 ecx, eax
            //   2bf1                 | sub                 esi, ecx
            //   8a08                 | mov                 cl, byte ptr [eax]
            //   884c0616             | mov                 byte ptr [esi + eax + 0x16], cl

        $sequence_3 = { 751b 53 53 53 }
            // n = 4, score = 500
            //   751b                 | jne                 0x1d
            //   53                   | push                ebx
            //   53                   | push                ebx
            //   53                   | push                ebx

        $sequence_4 = { 3b450c 72d9 eb02 33f6 8bc6 5e }
            // n = 6, score = 500
            //   3b450c               | cmp                 eax, dword ptr [ebp + 0xc]
            //   72d9                 | jb                  0xffffffdb
            //   eb02                 | jmp                 4
            //   33f6                 | xor                 esi, esi
            //   8bc6                 | mov                 eax, esi
            //   5e                   | pop                 esi

        $sequence_5 = { 8b06 894710 ff7604 035e08 ff5708 56 ff5708 }
            // n = 7, score = 500
            //   8b06                 | mov                 eax, dword ptr [esi]
            //   894710               | mov                 dword ptr [edi + 0x10], eax
            //   ff7604               | push                dword ptr [esi + 4]
            //   035e08               | add                 ebx, dword ptr [esi + 8]
            //   ff5708               | call                dword ptr [edi + 8]
            //   56                   | push                esi
            //   ff5708               | call                dword ptr [edi + 8]

        $sequence_6 = { 83f8ff 7404 3bc3 751b 53 }
            // n = 5, score = 500
            //   83f8ff               | cmp                 eax, -1
            //   7404                 | je                  6
            //   3bc3                 | cmp                 eax, ebx
            //   751b                 | jne                 0x1d
            //   53                   | push                ebx

        $sequence_7 = { 56 ff5708 59 59 3b5d08 }
            // n = 5, score = 500
            //   56                   | push                esi
            //   ff5708               | call                dword ptr [edi + 8]
            //   59                   | pop                 ecx
            //   59                   | pop                 ecx
            //   3b5d08               | cmp                 ebx, dword ptr [ebp + 8]

        $sequence_8 = { ff15???????? 8b0e 6a23 50 ff760c }
            // n = 5, score = 500
            //   ff15????????         |                     
            //   8b0e                 | mov                 ecx, dword ptr [esi]
            //   6a23                 | push                0x23
            //   50                   | push                eax
            //   ff760c               | push                dword ptr [esi + 0xc]

        $sequence_9 = { ff7604 035e08 ff5708 56 ff5708 59 }
            // n = 6, score = 500
            //   ff7604               | push                dword ptr [esi + 4]
            //   035e08               | add                 ebx, dword ptr [esi + 8]
            //   ff5708               | call                dword ptr [edi + 8]
            //   56                   | push                esi
            //   ff5708               | call                dword ptr [edi + 8]
            //   59                   | pop                 ecx

    condition:
        7 of them and filesize < 73728
}