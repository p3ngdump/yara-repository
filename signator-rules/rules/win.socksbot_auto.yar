rule win_socksbot_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2022-05-16"
        version = "1"
        description = "Detects win.socksbot."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.socksbot"
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
        $sequence_0 = { 6804010000 8d8578feffff 50 ff15???????? }
            // n = 4, score = 300
            //   6804010000           | push                0x104
            //   8d8578feffff         | lea                 eax, [ebp - 0x188]
            //   50                   | push                eax
            //   ff15????????         |                     

        $sequence_1 = { 6a03 6a00 53 e8???????? 8b75fc 83c40c e9???????? }
            // n = 7, score = 300
            //   6a03                 | push                3
            //   6a00                 | push                0
            //   53                   | push                ebx
            //   e8????????           |                     
            //   8b75fc               | mov                 esi, dword ptr [ebp - 4]
            //   83c40c               | add                 esp, 0xc
            //   e9????????           |                     

        $sequence_2 = { 4b ebdc 64a130000000 895de0 8b400c c745d803000000 8b4014 }
            // n = 7, score = 300
            //   4b                   | dec                 ebx
            //   ebdc                 | jmp                 0xffffffde
            //   64a130000000         | mov                 eax, dword ptr fs:[0x30]
            //   895de0               | mov                 dword ptr [ebp - 0x20], ebx
            //   8b400c               | mov                 eax, dword ptr [eax + 0xc]
            //   c745d803000000       | mov                 dword ptr [ebp - 0x28], 3
            //   8b4014               | mov                 eax, dword ptr [eax + 0x14]

        $sequence_3 = { 57 884508 8a450c bf???????? }
            // n = 4, score = 300
            //   57                   | push                edi
            //   884508               | mov                 byte ptr [ebp + 8], al
            //   8a450c               | mov                 al, byte ptr [ebp + 0xc]
            //   bf????????           |                     

        $sequence_4 = { 8975f4 897df0 8d5df7 33d2 0fb603 }
            // n = 5, score = 300
            //   8975f4               | mov                 dword ptr [ebp - 0xc], esi
            //   897df0               | mov                 dword ptr [ebp - 0x10], edi
            //   8d5df7               | lea                 ebx, [ebp - 9]
            //   33d2                 | xor                 edx, edx
            //   0fb603               | movzx               eax, byte ptr [ebx]

        $sequence_5 = { 0f84aa000000 8b9ea0000000 03df 895de0 8d4b04 894de8 8b01 }
            // n = 7, score = 300
            //   0f84aa000000         | je                  0xb0
            //   8b9ea0000000         | mov                 ebx, dword ptr [esi + 0xa0]
            //   03df                 | add                 ebx, edi
            //   895de0               | mov                 dword ptr [ebp - 0x20], ebx
            //   8d4b04               | lea                 ecx, [ebx + 4]
            //   894de8               | mov                 dword ptr [ebp - 0x18], ecx
            //   8b01                 | mov                 eax, dword ptr [ecx]

        $sequence_6 = { 7772 56 57 e8???????? 6a03 8bf0 57 }
            // n = 7, score = 300
            //   7772                 | ja                  0x74
            //   56                   | push                esi
            //   57                   | push                edi
            //   e8????????           |                     
            //   6a03                 | push                3
            //   8bf0                 | mov                 esi, eax
            //   57                   | push                edi

        $sequence_7 = { 8b5508 59 8d0c1e 43 }
            // n = 4, score = 300
            //   8b5508               | mov                 edx, dword ptr [ebp + 8]
            //   59                   | pop                 ecx
            //   8d0c1e               | lea                 ecx, [esi + ebx]
            //   43                   | inc                 ebx

        $sequence_8 = { 56 57 e8???????? 8d8520fdffff 6a0a 50 }
            // n = 6, score = 300
            //   56                   | push                esi
            //   57                   | push                edi
            //   e8????????           |                     
            //   8d8520fdffff         | lea                 eax, [ebp - 0x2e0]
            //   6a0a                 | push                0xa
            //   50                   | push                eax

        $sequence_9 = { 81c60c000100 4b 75d2 68???????? ff15???????? a0???????? }
            // n = 6, score = 300
            //   81c60c000100         | add                 esi, 0x1000c
            //   4b                   | dec                 ebx
            //   75d2                 | jne                 0xffffffd4
            //   68????????           |                     
            //   ff15????????         |                     
            //   a0????????           |                     

    condition:
        7 of them and filesize < 73728
}