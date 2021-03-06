rule win_spectre_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2022-05-16"
        version = "1"
        description = "Detects win.spectre."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.spectre"
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
        $sequence_0 = { 51 64a12c000000 8b0d???????? 53 66c745fc7475 b347 8b0c88 }
            // n = 7, score = 100
            //   51                   | push                ecx
            //   64a12c000000         | mov                 eax, dword ptr fs:[0x2c]
            //   8b0d????????         |                     
            //   53                   | push                ebx
            //   66c745fc7475         | mov                 word ptr [ebp - 4], 0x7574
            //   b347                 | mov                 bl, 0x47
            //   8b0c88               | mov                 ecx, dword ptr [eax + ecx*4]

        $sequence_1 = { 64a12c000000 8b0d???????? c745f4130e130b c745f8027d6747 8b0c88 a1???????? 3b8104000000 }
            // n = 7, score = 100
            //   64a12c000000         | mov                 eax, dword ptr fs:[0x2c]
            //   8b0d????????         |                     
            //   c745f4130e130b       | mov                 dword ptr [ebp - 0xc], 0xb130e13
            //   c745f8027d6747       | mov                 dword ptr [ebp - 8], 0x47677d02
            //   8b0c88               | mov                 ecx, dword ptr [eax + ecx*4]
            //   a1????????           |                     
            //   3b8104000000         | cmp                 eax, dword ptr [ecx + 4]

        $sequence_2 = { 3bc6 7233 8b4c2428 40 89442414 894c2410 }
            // n = 6, score = 100
            //   3bc6                 | cmp                 eax, esi
            //   7233                 | jb                  0x35
            //   8b4c2428             | mov                 ecx, dword ptr [esp + 0x28]
            //   40                   | inc                 eax
            //   89442414             | mov                 dword ptr [esp + 0x14], eax
            //   894c2410             | mov                 dword ptr [esp + 0x10], ecx

        $sequence_3 = { c745f42e237a75 66c745f87647 8b0c88 a1???????? 3b8104000000 7f14 }
            // n = 6, score = 100
            //   c745f42e237a75       | mov                 dword ptr [ebp - 0xc], 0x757a232e
            //   66c745f87647         | mov                 word ptr [ebp - 8], 0x4776
            //   8b0c88               | mov                 ecx, dword ptr [eax + ecx*4]
            //   a1????????           |                     
            //   3b8104000000         | cmp                 eax, dword ptr [ecx + 4]
            //   7f14                 | jg                  0x16

        $sequence_4 = { b855555515 eb0b 03c2 3b442404 0f42442404 c20400 56 }
            // n = 7, score = 100
            //   b855555515           | mov                 eax, 0x15555555
            //   eb0b                 | jmp                 0xd
            //   03c2                 | add                 eax, edx
            //   3b442404             | cmp                 eax, dword ptr [esp + 4]
            //   0f42442404           | cmovb               eax, dword ptr [esp + 4]
            //   c20400               | ret                 4
            //   56                   | push                esi

        $sequence_5 = { 56 ff742410 8bf1 ff742410 ff742410 8d4e18 e8???????? }
            // n = 7, score = 100
            //   56                   | push                esi
            //   ff742410             | push                dword ptr [esp + 0x10]
            //   8bf1                 | mov                 esi, ecx
            //   ff742410             | push                dword ptr [esp + 0x10]
            //   ff742410             | push                dword ptr [esp + 0x10]
            //   8d4e18               | lea                 ecx, [esi + 0x18]
            //   e8????????           |                     

        $sequence_6 = { 59 59 ebc4 83ec14 a1???????? 33c4 89442410 }
            // n = 7, score = 100
            //   59                   | pop                 ecx
            //   59                   | pop                 ecx
            //   ebc4                 | jmp                 0xffffffc6
            //   83ec14               | sub                 esp, 0x14
            //   a1????????           |                     
            //   33c4                 | xor                 eax, esp
            //   89442410             | mov                 dword ptr [esp + 0x10], eax

        $sequence_7 = { e8???????? 83c440 c3 55 8d6c24a0 81ec9c000000 a1???????? }
            // n = 7, score = 100
            //   e8????????           |                     
            //   83c440               | add                 esp, 0x40
            //   c3                   | ret                 
            //   55                   | push                ebp
            //   8d6c24a0             | lea                 ebp, [esp - 0x60]
            //   81ec9c000000         | sub                 esp, 0x9c
            //   a1????????           |                     

        $sequence_8 = { e8???????? 83ec18 bf???????? 8bcc 57 895910 }
            // n = 6, score = 100
            //   e8????????           |                     
            //   83ec18               | sub                 esp, 0x18
            //   bf????????           |                     
            //   8bcc                 | mov                 ecx, esp
            //   57                   | push                edi
            //   895910               | mov                 dword ptr [ecx + 0x10], ebx

        $sequence_9 = { e8???????? 83c420 85ed 745e 8b5c243c 8bf5 3bf3 }
            // n = 7, score = 100
            //   e8????????           |                     
            //   83c420               | add                 esp, 0x20
            //   85ed                 | test                ebp, ebp
            //   745e                 | je                  0x60
            //   8b5c243c             | mov                 ebx, dword ptr [esp + 0x3c]
            //   8bf5                 | mov                 esi, ebp
            //   3bf3                 | cmp                 esi, ebx

    condition:
        7 of them and filesize < 990208
}